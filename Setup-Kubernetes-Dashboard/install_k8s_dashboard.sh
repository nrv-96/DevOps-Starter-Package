# Add kubernetes-dashboard repository
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/

# Deploy a Helm Release named "kubernetes-dashboard" using the kubernetes-dashboard chart
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard

# Give Permission Service Account to get access of the Cluster
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: cluster-rolebinding-dashboard
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: kubernetes-dashboard-kong
  namespace: kubernetes-dashboard
EOF

# Create token to get access of dashboard
kubectl create token kubernetes-dashboard-kong -n kubernetes-dashboard  --duration=720h

# Wait until all pods are in running state
NAMESPACE="kubernetes-dashboard"
echo "⏳ Waiting for all pods in namespace '$NAMESPACE' to be in 'Running' state..."
while true; do
  NOT_READY_COUNT=$(kubectl get pods -n "$NAMESPACE" --no-headers \
    | grep -v "Running" \
    | wc -l)
  if [ "$NOT_READY_COUNT" -eq 0 ]; then
    break
  else
    echo "⏱️  $NOT_READY_COUNT pod(s) not in 'Running' state yet..."
    sleep 
  fi
done

# Service Port forward to access the dashboard 
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443

# Open URL
echo "Open Browser and Open to get access the dashboard https://localhost:8443/"
