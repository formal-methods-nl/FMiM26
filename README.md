# Formal Methods in Mathematics 2026

This repository contains material for the Formal Methods in Mathematics 2026
course for the Dutch Mastermath program. The course runs at Utrecht University.

The contents of this repository are derived from the
[Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/)
textbook by Jemery Avigad and Patrick Massot. In particular, all contents
of the `MIL/` folder are from the
[original repository](https://github.com/leanprover-community/mathematics_in_lean).

## Working with this repository

This repository contains two relevant folders:

- `MIL`: The textbook Mathematics in Lean. The lectures will roughly follow these
  notes, which contain many exercises. To work on the exercises,
  we strongly recommend to make a copy of that folder (next to the existing `MIL` folder)
  and to do the exercises in your copy.

- `Homework`: Contains the homework exercises for the course. For more information
  see the relevant section on the [Mastermath course page](https://elo.mastermath.nl/course/view.php?id=1251).
  To fetch the latest homework exercises, you can update the repository in VS code
  or manually download the exercise file and put it in the `Homework` folder.

## Installation

There are a few ways to interact with Lean, of which we list three.

### Online Lean usage

For the first lecture you don't necessarily need a local Lean installation. Instead,
you can use the [online Lean editor](https://live.lean-lang.org/). Beware that your progress is not saved there,
so make sure that you copy your code from time to time to a local file.

### Local installation

For further progress in the course, it is highly recommended to install Lean locally on your computer. The recommended
way is to install VS Code and the Lean extension following the first 3 steps of these
[instructions](https://docs.lean-lang.org/lean4/doc/quickstart.html).

Now, open VS Code and click on the forall symbol on the right hand side of the screen and select
`Open Project > Project: Download Project`:
![download project dialog](images/vscode-download-project.png)

There will appear a text box, in which you copy the following URL:
```
https://github.com/formal-methods-nl/FMiM26
```
After selecting a path where the project should be installed on your computer, wait for a few minutes
for everything to download and compile.

### Github Codespaces

If you have trouble installing Lean, you can use Lean directly in your browser using Github
Codespaces.
This requires a Github account. If you are signed in to Github, click here:

<a href='https://codespaces.new/formal-methods-nl/FMiM26' target="_blank" rel="noreferrer noopener"><img src='https://github.com/codespaces/badge.svg' alt='Open in GitHub Codespaces' style='max-width: 100%;'></a>

Make sure the Machine type is `4-core`, and then press `Create codespace`
(this might take a few minutes).
This creates a virtual machine in the cloud,
and installs Lean and Mathlib.

Opening any `.lean` file in the MIL folder will start Lean,
though this may also take a little while.
We suggest making a copy of the `MIL` directory, as described
in the instructions above for using MIL on your computer.
You can update the repository by opening a terminal in the browser
and typing `git pull` followed by `lake exe cache get` as above.

Codespaces offers a certain number of free hours per month. When you are done working,
press `Ctrl/Cmd+Shift+P` on your keyboard, start typing `stop current codespace`, and then
select `Codespaces: Stop Current Codespace` from the list of options.
If you forget, don't worry: the virtual machine will stop itself after a certain
amount of time of inactivity.

To restart a previous workspace, visit <https://github.com/codespaces>.

## Useful links

### Searching the library

Finding the right lemmas to use is hard. These websites can help you find what you need:

- [mathlib documentation](https://leanprover-community.github.io/mathlib4_docs/): mathlib library
  documentation.
- [Loogle](https://loogle.lean-lang.org/): Syntactic library search.
- [leansearch](https://leansearch.net/): LLM-powered semantic library search.

### Connecting with the community

- [Zulip chat](https://leanprover.zulipchat.com/): A discussion forum for Lean users. If you have any
  questions about Lean, feel free to ask them there.
- [Loki](https://formal-methods.nl/loki): Weekly formalisation meetup in Utrecht.
