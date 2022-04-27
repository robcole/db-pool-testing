# db-pool-testing

Attempting to build replication steps to track a potential error in how DB::Pool tracks the number of @inflight (neither in @total [open connections] or @idle [idle connections]).