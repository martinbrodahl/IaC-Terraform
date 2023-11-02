The Terraform configuration uses 4 workspaces "default | dev | stage | prod". The default workspace are used as a starting point.During edits & configuration a branch will be made "dev | staging | prod", which correlates to the workspace we are currently deveopling in.
The main branch are our base, i.e. we create temporarily branches where we make changes, when the job is finished we merge the temporarily branch with main, so main always has a (currently) finished product.

PR = (GitHub) Pull Request

1. Always start from the default-workspace.
2. Create temporarily branch "dev | staging | prod". (manually)
3. Make code-changes in the branch. Upon push, this will trigger a validate-action on the current branch.
4. If it was successfull: create PR "main <- the current branchen" (manually).
   - Hvis ikke successfull fortsetter man å gjøre kode-endringer og push'e dette helt til successfull validate-action.
5. PR vil trigge en deploy-action som plan & apply'er infrastrukturen til dev-workspace, ETTER at den gjeldende branchen successfully er merget sammen med main.
6. Slette den midlertidlige opprettede branchen (dette gjør man under PR), ettersom at vi er ferdige med arbeidet.
7. Repeat (i forhold til neste workspace, da stage, så prod).
8. [...]
9. In the prod-workspace, it needs an approval in pt.5 to deploy the infrastructure!

This implements a good CICD workflow with step by step development from start to the finished infrastructure, which also is scalabe, secure and easy maintainable.

The CICD is orchestrated like this:
Workspace:
default -> dev    (dev-branch)
            |
            |          PR
            v
default -> stage  (staging-branch)
            |
            |          PR
            v
default -> prod   (prod-branch)
            ||
   Finished infrastructure