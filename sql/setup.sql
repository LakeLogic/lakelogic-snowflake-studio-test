-- Runs the generated task files (tasks/<group>/*.sql) in group order. Called by
-- sql/bootstrap.sql with USING (DB, WH, POOL, REPO, BRANCH); deploy/deploy_project.py runs the
-- same files from a laptop. Nothing here names a system.
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/admin/_setup.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/admin/_maintenance.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/data/_mesh_orchestrator.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/data/marketing_google_ads.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/data/marketing_google_analytics.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/data/marketing_hubspot.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/data/marketing_meta_ads.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/data/marketplace_rideflow.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/data/operations_checkr.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/data/operations_twilio.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/data/operations_zendesk.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/data/payments_stripe.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/data/reference_internal.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/monitor/_slo_checks.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/privacy/_erasure.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/privacy/_retention_check.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
EXECUTE IMMEDIATE FROM @{{DB}}."pipeline".{{REPO}}/branches/{{BRANCH}}/tasks/test/_synthetic_seed.sql USING (DB => '{{DB}}', WH => '{{WH}}', POOL => '{{POOL}}', REPO => '{{REPO}}', BRANCH => '{{BRANCH}}');
