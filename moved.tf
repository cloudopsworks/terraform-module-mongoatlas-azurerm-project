##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#
# Migration blocks: resources moved to module.project submodule.
#

moved {
  from = mongodbatlas_encryption_at_rest.this
  to   = module.project.mongodbatlas_encryption_at_rest.this
}
