# Enhanced Instructions for GitHub Issue Resolution - GitHub Copilot Agent

## Overall Goal
Resolve the issues listed on this GitHub repository in sequential order, adhering to the principles of code enhancement and minimizing unnecessary refactoring. The issues are created in a specific sequence based on dependencies; therefore, understand that earlier issues lay the groundwork for later ones. Please focus on implementing the specific changes required by each issue's acceptance criteria.

---

## 1. Initial Setup & Branching (Do not ask me about these steps)

1. **Pull the Latest Code**: Always start by pulling the latest changes from `origin/master` to ensure your local repository is up-to-date.
    ```bash
    git pull origin master
    ```

2. **Create and Switch to a Feature Branch**: Create a new branch for the issue you are working on. Use the naming convention `<issue_number>-<brief_description>` (e.g., `1-user-authentication`).
    ```bash
    git checkout -b <issue_number>-<brief_description>
    ```

3. **Verify Branch**: Confirm you are on the correct branch before making any changes.
    ```bash
    git branch
    ```

---

## 2. Issue Understanding & Code Review (Critical - Requires AI Analysis)

1. **Review the Issue**: Carefully read the issue description and acceptance criteria. Use this as your primary guide for implementation.

2. **Analyze the Codebase**: Examine the relevant parts of the codebase to understand existing functionality. Prioritize reusing or enhancing existing code over adding new functionality.

3. **Document Findings**: If you identify dependencies or areas requiring clarification, document them in the `scratchpad.md` file under "Analysis".

---

## 3. Implementation & Prioritization (Core Coding Logic)

1. **Leverage Existing Code**: Modify or extend existing functionality to meet the acceptance criteria. Avoid introducing new components unless absolutely necessary.

2. **Minimize Refactoring**: Focus on targeted changes to achieve the desired result. Avoid broad refactoring unless it directly contributes to resolving the issue.

3. **Follow the "Spirit" of the Criteria**: If existing code provides equivalent functionality, minor deviations (e.g., route names) are acceptable as long as the core intent is fulfilled.

---

## 4. Testing & Validation (Crucial for Verification)

1. **Write Tests**: If the issue involves backend functionality, write unit tests to validate the changes. For frontend changes, ensure the UI behaves as expected.

2. **Run Tests**: Execute all relevant tests to confirm the changes work as intended.
For backend tests:  refer to #file:.github/python-testing.md
For frontend tests: refer to #file:.github/vue-testing.md


3. **Document Testing Instructions**: Provide clear, step-by-step instructions for manual verification.

---

## 5. Completion & Pull Request

1. **Commit Changes**: Use descriptive commit messages that reference the issue number.
    ```bash
    git commit -m "Fix: Resolve issue #<issue_number> - [Brief description of change]"
    ```

2. **Push Changes**: Push the feature branch to the remote repository.
    ```bash
    git push origin <feature_branch>
    ```

3. **Create a Pull Request**: Use the `gh` CLI to create a pull request. Include the appropriate syntax to auto-close the issue upon merging (e.g., `Resolves #<issue_number>`).
    ```bash
    gh pr create --base master --title "Fix: Resolve issue #<issue_number>" --body "Resolves #<issue_number>"
    ```

---

## 6. Feedback Loop

1. **Address Feedback**: If the pull request requires changes, focus specifically on the areas related to the acceptance criteria. Avoid making unrelated changes.

2. **Iterate**: Update the pull request as needed and notify reviewers when ready for re-review.

---

## Workflow: Issue Management with `gh` & Git

This workflow focuses on efficiency, clarity, and best practices. I'll break it down into stages: Discovery, Assignment/Preparation, Development, and Completion.

### 1. Discovery - Finding Issues to Work On

- **List Open Issues**:
    ```bash
    gh issue list --limit 10 --state open --assignee @your_github_username
    ```
    Replace `@your_github_username` with your actual GitHub username.

- **Search for Issues (Based on Keywords)**:
    ```bash
    gh issue list --search "label:bug priority:high"
    ```

- **Filter by Milestone**:
    ```bash
    gh issue list --milestone "Release 1.0" --state open
    ```

---

### 2. Assignment & Preparation - Claiming and Setting Up an Issue

- **Claim/Assign the Issue**:
    ```bash
    gh issue edit <issue_number> --assignee @your_github_username
    ```

- **Create a Branch**:
    ```bash
    git checkout -b feature/issue-<issue_number> master
    ```

- **Pull Latest Changes**:
    ```bash
    git pull origin feature/issue-<issue_number>
    ```

---

### 3. Development - Coding and Committing

- **Stage Changes**:
    ```bash
    git add .
    ```

- **Commit Changes**:
    ```bash
    git commit -m "Fix: Resolve issue #<issue_number> - [Brief description of change]"
    ```

- **Push Changes**:
    ```bash
    git push origin feature/issue-<issue_number>
    ```

---

### 4. Completion & Closing - Review, Merge, and Issue Closure

- **Create a Pull Request (PR)**:
    ```bash
    gh pr create --base master --title "Fix: Resolve issue #<issue_number>" --body "Resolves #<issue_number>"
    ```

- **Close the Issue**:
    ```bash
    gh issue close <issue_number>
    ```

---

## Best Practices Recap

- **Branching Strategy**: Always work on feature branches. Never commit directly to `master`.
- **Clear Commit Messages**: Use descriptive commit messages that reference the issue number.
- **Pull Requests**: Use pull requests for code review and collaboration.
- **Issue Linking**: Ensure your commits and PRs are linked to the relevant issues.
- **Regularly Pull Changes**: Keep your feature branch up-to-date with `master`.