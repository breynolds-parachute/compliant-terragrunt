# Terragrunt Compliance POC

This repository demonstrates how Terragrunt might be used in a manner more closely resembling Parachute's existing compliance procedures.

## Directory Structure

Within the [terragrunt](./terragrunt/) directory, there is a subdirectory for each logical "environment" as well as a subdirectory for "common" elements which are shared by multiple environments. Common infrastructure may be "upstream" of the environments, meaning the environment terraform is dependent on the common infrastructure, or vice-versa, where the common infrastructure is "downstream" of the environments.

## Workflow

With this sort of structure, a single PR may be made which updates the code for ALL environments along with any common infrastructure. When it's time to deploy to "dev" the following command can be used:

```sh
./deploy.sh dev
```

This script will construct and execute a terragrunt command which excludes all environments except the one provided:

```sh
terragrunt run-all apply --terragrunt-exclude-dir ./master --terragrunt-exclude-dir ./prod
```

Terragrunt would then apply the following groups:

```
Group 1
- Module /terragrunt/common/upstream

Group 2
- Module /terragrunt/dev

Group 3
- Module /terragrunt/common/downstream
```

During apply of the "downtream" module, the existing outputs from the excluded environments would be used. In the event that there are new outputs which have not yet been applied, the mock outputs would be used instead.

