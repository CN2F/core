kubectl apply -f 0-ns.yaml -f 1-cassandra.yml -f 2-hss.yml -f 3-mme-cfg.yml -f 3-mme.yml
sleep 60
kubectl apply -f 4-spgwc.yml -f 5-spgwu.yml
