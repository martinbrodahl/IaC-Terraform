The Terraform configuration uses 4 workspaces "(default) | dev | stage | prod". The default workspace are used as a starting point.During edits & configuration a branch will be made "dev | staging | prod", which correlates to the workspace we are currently deveopling in.
The main branch are our code base, i.e. we create temporarily branches where we make code-changes, when the job is finished we merge the temporarily branch with main, so main always has a (currently) finished product.

PR = (GitHub) Pull Request

How to use this script:
1. Always start from the default-workspace.
2. Create temporarily branch "dev | staging | prod" (manually). Remember to publish the branch to Github.
3. Make code-changes in the branch. Upon push, this will trigger a validate-action on the current branch.
4. If it was successful: create PR "main <- the current branch" (manually).
   - If not successful: contintue to make code-changes and push this, until the validate-action is successful.
5. PR will trigger a deploy-action that plan & apply the infrastructure to the "dev | stage | prod"-workspace, AFTER the current branch is successfully merget together with the main branch.
6. Delete the temporarily branch (this is done manually during PR), as we have finished the work.
7. Repeat (in relation to the next workspace, in this case: first stage-workspace and then prod-workspace).
8. [...]
9. In the prod-workspace, it needs an approval in pt.5 to deploy the infrastructure!

This implements a good CICD workflow with step by step development from start to the finished infrastructure, which is also scalable, secure and easy maintainable.

The CICD is orchestrated like this:
Workspace:
default --> dev    (dev-branch)        |
         |                             | 
         |          PR                 |
         v                             |
default --> stage  (staging-branch)    |    
         |                             |    =    CICD
         |          PR                 |
         v                             |
default --> prod   (prod-branch)       |
            ||                         |
   Finished infrastructure             |