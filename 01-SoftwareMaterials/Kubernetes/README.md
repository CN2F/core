# Preparing k8s materials

In order to prepare all the materials properly, there are several steps that you must complete.

## On Master
 - Download the pod definition files that reside in the [configs](./configs/) directory.
 - Download the necessary bash scripts for deploying modules with ease from the [scripts](./scripts/) directory.

## On Core worker
 - Create a directory called `db_init` according to the `initvol hostpath` specification in `cassandra` definition file, and place the file [oai_db.cql](./attach/oai_db.cql) inside the newly created directory.
## On RRU/eNB worker
 - To avoid downloading `uhd` images during deployment, we use a mounted `uhd` directory. You can copy the entire [uhd](./attach/uhd/) folder to your home directory for this purpose.
