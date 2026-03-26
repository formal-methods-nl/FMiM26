/-
Homework 4
Please complete the Lean code below.

If you're stuck, please describe your partial progress (as comments).
You could also state some intermediate goal, "sorry" it, and move on etc.
(to obtain part of the points for the problem).
-/

/-
Name:           John Doe
University:     University of Somewhere
Student number: s123456
-/

import Mathlib

-- The next line is to ensure that variables are introduced explicitly; you can just ignore it.
set_option autoImplicit false


-- Namespace, to avoid name clashes with Mathlib.
namespace HW4

/-
# Graphs

Let `G` be a type. A *simple graph* on `G` is a relation `_ ~~ _ : G → G → Prop`
that is symmetric and irreflexive:
- for all `x y : G` we have `x ~~ y` implies `y ~~ x`
- for all `x : G` we have that `x ~~ x` is false
-/

/-
## Exercise 1.
Define a typeclass with a type `G` as parameter,
and with one field `rel` that encodes the graph relation `G → G → Prop`.
Also add two fields `rel_symm` and `rel_irrefl`.
Note that we can only set up the notation `x ~~ y` after the definition is complete.
So the two fields `rel_symm` and `rel_irrefl` must be expressed in terms of `rel` directly.

Uncomment the code below, and complete it.
-/

-- class SimpleGraph (G : Type*) where
--  rel : /- replace this with the type of `rel` -/
--  /- add fields here -/

/-
We set up notation for `Graph.rel`. From now on we can write `x ~~ y` for the graph relation.

Uncomment the code below to enable the notation.
-/
-- notation3 x " ~~ " y => SimpleGraph.rel x y
--
-- -- A quick check to see the notation in action.
-- variable (G : Type*) [SimpleGraph G] (x y : G) in
-- #check x ~~ y

/-
# Discrete and complete graphs

The *discrete* graph on `X` is the graph where no vertices are related.
The *complete* graph on `X` is the graph where all vertices are related to all vertices except themselves.
-/

-- We create two "type aliases" for the underlying vertices of these graph structures.
def DiscreteGraph (X : Type*) := X
def CompleteGraph (X : Type*) := X

/-
## Exercise 2.
Define the appropriate instances on `DiscreteGraph X` and `CompleteGraph X`.

Uncomment the code below, and complete it.
-/

-- instance (X : Type*) : SimpleGraph (DiscreteGraph X) where
--   rel := /- replace this with the relation -/
--   /- add more proofs here -/

-- instance (X : Type*) : SimpleGraph (CompleteGraph X) where
--   /- complete this -/

/-
## Exercise 3.
Let `G₁` and `G₂` be simple graphs.
-/

-- uncomment this line
-- variable {G₁ G₂ : Type*} [SimpleGraph G₁] [SimpleGraph G₂]

/-
A *graph homomorphism* (in this exercise) is a function `G₁ → G₂` that preserves the graph relations.
Define a structure `IsGraphHom` that takes a function `f : G₁ → G₂` as parameter,
and a field `map_rel` that expresses that `f` is a graph homomorphism.

Uncomment the code below, and complete it.
-/

-- structure IsGraphHom /- complete this -/

/-
## Exercise 4.
Show that for any type `X`, all functions `f : DiscreteGraph X → CompleteGraph X` are graph homomorphisms.

Uncomment the code below, and complete it.
-/

-- example (X : Type*) (f : DiscreteGraph X → CompleteGraph X) : IsGraphHom f where
--   /- complete this -/

end HW4

/-!
# Exercise 5

In this exercise you will create a tiny hierarchy,
by implementing some classes and instances.

We start by recalling the notation typeclass for the diamond operator
which we used in the lectures.
-/

class Dia (α : Type*) where
  dia : α → α → α

infixl:70 " ⋄ "   => Dia.dia -- type using \diamond

/-
Now implement two typeclasses that assert the commutativity (resp. associativity) of the diamond operator.
-/

class IsCommutative (α : Type*) [Dia α] where
  dia_comm : sorry -- fill this in yourself

export IsCommutative (dia_comm)

-- class IsAssociative
-- finish this yourself

namespace Prod

variable {α β : Type*} [Dia α] [Dia β]

/-
Define an instance for the diamond operator on `α × β`, by applying the operator coordinatewise.
-/

-- instance : Dia (α × β)
-- finish this yourself

/-
You might want to add some `simp`-lemmas, for use in proofs below.
-/

-- add simp lemmas here, if you want

/-
Finally, provide instances that show
* If `α` and `β` are both commutative, then so is `α × β`
* If `α` and `β` are both associative, then so is `α × β`
-/

-- write these instances here

end Prod
