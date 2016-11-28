# Contributing to the COBRA Toolbox

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

The following is a set of guidelines for contributing to the COBRA Toolbox, which is hosted [here](https://github.com/opencobra/cobratoolbox). Feel free to propose changes to this document in a pull request.

<!-- MDTOC maxdepth:6 firsth1:1 numbering:1 flatten:0 bullets:0 updateOnSave:1 -->

1. [Contributing to the COBRA Toolbox](#contributing-to-the-cobra-toolbox)   
&emsp;1.1. [How can I contribute?](#how-can-i-contribute)   
&emsp;&emsp;1.1.1. [Reporting an issue](#reporting-an-issue)   
&emsp;&emsp;&emsp;1.1.1.1. [How do I submit a (good) issue report?](#how-do-i-submit-a-good-issue-report)   
&emsp;&emsp;&emsp;1.1.1.2. [Template for submitting an issue](#template-for-submitting-an-issue)   
&emsp;&emsp;1.1.2. [Submitting a pull request (PR)](#submitting-a-pull-request-pr)   
&emsp;&emsp;1.1.3. [Suggesting enhancements](#suggesting-enhancements)   
&emsp;&emsp;&emsp;1.1.3.1. [How do I submit a (good) enhancement suggestion?](#how-do-i-submit-a-good-enhancement-suggestion)   
&emsp;&emsp;&emsp;1.1.3.2. [Template for submitting an enhancement suggestion](#template-for-submitting-an-enhancement-suggestion)   
&emsp;1.2. [Styleguides](#styleguides)   
&emsp;&emsp;1.2.1. [Git Commit Messages](#git-commit-messages)   
&emsp;&emsp;1.2.2. [Code styleguide](#code-styleguide)   
&emsp;&emsp;1.2.3. [Documentation and Comments styleguide](#documentation-and-comments-styleguide)   
&emsp;&emsp;1.2.4. [Test styleguide](#test-styleguide)   
&emsp;1.3. [Labels](#labels)   

<!-- /MDTOC -->

## How can I contribute?

### Reporting an issue

This section guides you through submitting an issue for the COBRA Toolbox. Following these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior :computer: :computer:, and fix it.

* **Pull the latest version of the COBRA Toolbox** You might be able to find the cause of the problem yourself. Most importantly, check if you can reproduce the problem with the latest version, if the problem happens when you run your script/function using the COBRAToolbox with a different version of `MATLAB` or when using a different computer :computer: or different operating system (such as `Linux`, `Windows`, or `macOS`).
* **Check the list of currently reported issues [here](https://github.com/opencobra/cobratoolbox/issues)**. If you happen to find a related issue, please use that thread or refer in your new issue to an already existing one.
* **Check the COBRA Toolbox Forum on Google [here](https://groups.google.com/forum/#!forum/cobra-toolbox)** Has your question already been asked, or has your problem already been reported. If it has, add a comment to the existing issue instead of opening a new one.

#### How do I submit a (good) issue report?

After you've determined that you discovered a new bug and need to open a new issue, you may want to follow these guidelines in order to have your issue resolved quickly.

Explain the problem and include additional details to help maintainers reproduce the problem:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Provide information when you last updated the COBRA Toolbox or which tagged version you are using**. It is important to know which version you are using in order to reproduce the error.
* **Describe the exact steps which reproduce the problem** in as many details as possible. For example, start by explaining how you started and initialized the COBRA Toolbox.
* **Provide specific examples to demonstrate the steps**. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples. If you're providing snippets in the issue, use [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**

Provide details on the nature of the issue:

* **If you're reporting that `MATLAB` crashed**, include a crash report. Importantly, include the script that ran before the crash occurred, and indicate the line that you think that made `MATLAB` crash. As this is an operating system related issue, please make sure to test the same code on a different computer and/or operating system :computer: before reporting the issue.
* **If the problem is related to performance**, include more details, such as CPU information, RAM, computer brand/model. Eventually, mention where you feel potential improvements could be made.
* **If the problem wasn't triggered by a specific action**, describe what you were doing before the problem happened and share more information using the guidelines below.

Include details about your configuration and environment:

* **Provide details on your `startup.m` and your `pathdef.m` file.** If you have pre-configured your system to load the files of the COBRA Toolbox, please give more details about which solver directories, COBRA
* **Which version of MATLAB are you using?**
* **What's the name and version of the OS you're using?**
* **Which solvers do you have installed?** You can get that list by running `initCobraToolbox`.

Provide more context by answering these questions:

* **Might the problem be related to an external program?** If you are using a specific `MATLAB` function or a pre-compiled binary and the problem occurs with that function call, please mention it here.
* **Did the problem start happening recently** (e.g. after updating to a new version of Atom) or was this always a problem?
* If the problem started happening recently, **can you reproduce the problem in an older version of the COBRA Toolbox?** What's the most recent version in which the problem doesn't happen? You can checkout older versions of the COBRA Toolbox using `git checkout <tag or commit-ID>`.
* **Can you reliably reproduce the issue?** If not, provide details about how often the problem happens and under which conditions it normally happens.
* If the problem is related to working with models, **does the problem happen for all COBRA models, or only some?**

#### Template for submitting an issue

    [Short description of problem here]

    1. Reproduction Steps

        1. [First Step]
        2. [Second Step]
        3. [Other Steps...]

    2. Expected behavior

    [Describe expected behavior here]

    3. Observed behavior

    [Describe observed behavior here]

    4. Issue nature

    - Did `MATLAB` crash? [Yes/No] If yes, include a crash report.
    - Do you report a performance issue? [Yes/No] If yes, include more details (see above)
    - Was the issue triggered through a specific action? [Yes/No] If yes, describe what you were doing in more detail.

    5. System information

    - ***`pathdef.m` and `startup.m`*** [Provide details here, e.g. which directories are included and where they are stored]
    - ***`MATLAB` version:*** [Enter MATLAB version here]
    - ***OS and version:*** [Enter OS name and OS version here]
    - ***Installed solvers*** [Provide a list of installed solvers here]

    6. Additional information

    - Problem might be related to external program (e.g., solver) and *not* the COBRA Toolbox: [Yes/No]
    - Problem started happening recently, didn't happen in an older version of the COBRA Toolbox: [Yes/No]
    - Problem can be reliably reproduced, doesn't happen randomly: [Yes/No]
    - Problem happens for all COBRA models, not only some: [Yes/No]

### Submitting a pull request (PR)

If this is your first time submitting a PR, or would need to have more information on how to do it, this [link](https://www.digitalocean.com/community/tutorials/how-to-create-a-pull-request-on-github) might come in handy. The official [GitHub guide](https://help.github.com/articles/creating-a-pull-request/) may also help you in the submission process.

Before submitting the PR, please make sure that you do the following:

* Follow the [Code styleguide](#code-styleguide).
* Document new code based on the [Documentation styleguide](#documentation-and-comments-styleguide).
* Make sure to include a test according to the[Test styleguide](#test-styleguide).
* Write platform-independent code (the code must work on Linux):
    * Use `pwd` to get the current directory.
    * Use `filesep` for paths (e.g., `['myPath' filesep 'myFile.m']`).
* Computational results must be confirmed to be reproducible

There is no particular template for submitting a PR, but do not submit a PR with too many files being changed at once. Please make sure that you document exactly what errors/issues that this PR addresses.

When fixing an issue or error, you shall document the current output and the new output that is expected with the fix.

A complete PR should hence have 3 distinct sections:

    1. Errors/fixes (with reference to eventual open issues)
          - Previous output
          - Output of PR-merged version
    2. Documentation updates
    3. Tests tailored to test the PR

### Suggesting enhancements

This section guides you through submitting an enhancement suggestion for the COBRA Toolbox, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions :mag_right:. Before submitting an enhancement suggestion, check the documentation. You might discover that the enhancement is already available. Most importantly, check if you're using the latest version of the COBRA Toolbox.

#### How do I submit a (good) enhancement suggestion?

After you've determined that your suggestion is a valuable enhancement, create an issue on that repository and provide the following information:

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
* **Provide specific examples to demonstrate the steps**. Include copy/pasteable snippets which you use in those examples, as [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
* **Explain why this enhancement would be useful** to most COBRA Toolbox users.

#### Template for submitting an enhancement suggestion

    [Short description of suggestion]

    **Steps that explain the enhancement**

    1. [First Step]
    2. [Second Step]
    3. [Other Steps...]

    **Current and suggested behavior**

    [Describe current and suggested behavior here]

    **Why would the enhancement be useful to most users**

    [Explain why the enhancement would be useful to most users]

    [List some other text editors or applications where this enhancement exists]

## Styleguides

### Git Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally
* When only changing documentation, include `[ci skip]` in the commit description
* Consider starting the commit message with an applicable emoji:
    * :bug: `:bug:` when fixing a bug
    * :art: `:art:` when improving the format/structure of the code
    * :racehorse: `:racehorse:` when improving performance
    * :memo: `:memo:` when writing docs
    * :fire: `:fire:` when removing code or files
    * :white_check_mark: `:white_check_mark:` when adding tests
    * :penguin: `:penguin:` when fixing something on Linux
    * :apple: `:apple:` when fixing something on macOS
    * :computer: `:computer:` when fixing something on Windows
    * :green_heart: `:green_heart:` when fixing the CI build

### Code styleguide

* Write `if singleCondition`, and not `if (singleCondition)`. Use brackets only for multiple conditions.
* Use spaces around operators, e.g., `i + 1` instead of `i+1`
* Use spaces after commas (unless separated by newlines)
* Avoid spaces inside the curly-braces of cells: `{a, b}` instead of `{ a, b }`
* Use spaces after commas in lists, after operands, after names, etc. This also improves readability. e.g. `a = [ 1, 2, 3; 4, 5, 6 ];` instead of `a=[1,2,3;4,5,6]`;
* Include a single line of whitespace between blocks of code
* Avoid ambiguity when naming variables: be as specific as possible
* When using mixed words, separate with capital letters, e.g. `calculateKineticFlux`
* All variable names must be ritten in English
* Use verb-noun structure for functions: allows to explain the operations performed
* Append meaningful prefixes when possible, e.g. `Av`, `Sum`, `Min`, `Max`, etc
* Boolean type variables, i.e. with only True/False values, with `Is` or `is` to stress this fact, e.g. `if dataIsLoaded`
* Reuse names for short-life and variables with local scope, such as indexes of loops
* Only use `i`, `j`, etc., as indexes for very short loops
* Add sanity checks to the code, e.g., if something does not work as expected, there should be code to check for this and either issue a warning or an error if there is a problem.
* Do not encode the absolute position of any files within any function.

<!-- find some style guidelines online from MATLAB and compare with Julia -->

### Documentation and Comments styleguide

* Make sure the code is fully documented and commented
* Indent the code: really improves readability.
* Portability: use relative paths, where possible
* Fix a maximum line length: break large ones if needed. Ensure that it is clear that the sentence is separated through different lines, e.g.:
```
function [ parameter1, parameter2, parameter3, parameter4 ] = FunctionManyParameters…
    …( InputParameter1, InputParameter2, InputParameter3, InputParameter3,...
...InputParameter4, InputParameter5 )
```
* Divide the code in separate functional files whenever it is possible (and logical)
* Header for each file with the following elements:
    * Brief description (easy and short functions) or more detailed explanations (more complicated functions).
    * Description of `Input` and `Output` variables
    * Authors, co-authors, contributors (and the contribution of each of them)
    * Date of first fully operative version, and dates of consequent modifications with the corresponding number of version, e.g. `v1 - 11/06/2014 / v2 - 12/08/2014`
    * Description of modifications in later versions, e.g. `v2: the efficiency has been improved by substituting the loops with matrices operations`
* Throughout the file:
    * Comment smartly. Not every line, but enough to allow tracking the execution
    * Try to use brief comments.
    * In case you believe a more complicated part requires a more comprehensive explanation, describe `What are you doing` and `How it is done through a more detailed paragraph`.
    * If the code is divided in blocks, you can also introduce briefly what is the function of each block beforehand.


### Test styleguide

<!--- Laurent -->

## Labels

This section lists the labels we use to help us track and manage issues and pull requests. The labels are loosely grouped by their purpose, but it's not required that every issue have a label from every group or that an issue can't have more than one label from the same group.

| Label name | Description |
| -----------| --- |
| `beginner` | Less complex issues which would be good first issues to work on for users who want to contribute to Atom. |
| `bug` | Confirmed bugs or reports that are very likely to be bugs. |
| `crash` | Reports of Atom completely crashing. |
| `documentation` | Related to any type of documentation |
| `duplicate` | Issues which are duplicates of other issues, i.e. they have been reported before. |
| `enhancement` | Feature requests. |
| `help wanted` | The Atom core team would appreciate help from the community in resolving these issues. |
| `in progress` | Pull requests which are still being worked on, more changes will follow. |
| `invalid` | Issues which aren't valid (e.g. user errors). |
| `linux` | Related to the COBRA Toolbox running on Linux. |
| `mac` | Related to the COBRA Toolbox running on macOS. |
| `needs more information` | More information needs to be collected about these problems or feature requests (e.g. steps to reproduce). |
| `needs reproduction` | Likely bugs, but haven't been reliably reproduced. |
| `needs response` | A response is needed from the author of the PR. Issue will likely be closed unless a response is provided. |
| `needs review` | Pull requests which need code review, and approval from maintainers or the COBRA Toolbox core team. |
| `needs testing` | Pull requests which need manual testing. |
| `performance` | Related to performance. |
| `question` | Questions more than bug reports or feature requests (e.g. how do I do X). |
| `requires changes` | Pull requests which need to be updated based on review comments and then reviewed again. |
| `under review` | Pull requests being reviewed by maintainers or the COBRA Toolbox core team. |
| `windows` | Related to the COBRA Toolbox running on Windows. |
| `wontfix`  | The COBRA Toolbox core team has decided not to fix these issues for now, either because they're working as intended or for some other reason. |

*This guide is inspired by [ATOM's contributing guide](https://github.com/atom/atom/blob/master/CONTRIBUTING.md).*
