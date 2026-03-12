/-
Homework 3
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

/-
## Exercise 1.
Please fill out the sorry's below with Lean proofs.
-/
-- (a)
lemma descent (a b c k : ℕ) (h : a * b = c ^ k) : a.Coprime b → ∃ x y, a = x ^ k ∧ b = y ^ k := by
  sorry
  -- hint: distinguish between the cases c = 0 and c ≠ 0 (and consider the prime factorization in the latter case).

-- (b)
lemma cubes_differ_one (x y k : ℕ) (hk : k ≥ 2) (h : x ^ k = y ^ k + 1) : y = 0 := by
  -- hint: Write x = y + z for some z : ℕ.
  -- hint: The following fact might be useful. Induction can help here.
  have aux : ∀ m ≥ 2, y ≠ 0 → y ^ m + 1 < (y + 1) ^ m := by
    sorry
  sorry

-- (c)
theorem Diophantine (x y k : ℕ) (hk : k ≥ 2) (h : x ^ 2 + x = y ^ k) : x = 0 ∧ y = 0 := by
  sorry
  -- hint: use the previous two lemmas.

/-
## Exercise 2.
-/

variable {α : Type} [PartialOrder α]

/--
A chain with starting point `x` and endpoint `y` in an ordered type `α` is a sequence of elements
`x < x₀ < ... < xₙ < y`.
-/
inductive Chain : α → α → Type where
  | singleton (x : α) : Chain x x
  | cons {x y : α} (c : Chain x y) (a : α) (h : y < a) : Chain x a

/- Implement the following function and fill the `sorry`s in the lemmas below. -/
/--
The length of a chain is defined to be the number of `<`s in the chain, i.e.
the singleton list `{x}` has length `0`.
-/
def Chain.length {x y : α} : Chain x y → ℕ :=
  sorry

/-
The lemmas `Chain.length_singleton` and `Chain.length_cons` are what we call API lemmas
for the definition `Chain.length`. They uniquely specify the behaviour of `Chain.length`.
-/

lemma Chain.length_singleton (x : α) : (Chain.singleton x).length = 0 :=
  sorry

lemma Chain.length_cons {x y : α} (c : Chain x y) (z : α) (h : y < z) :
    (Chain.cons c z h).length = c.length + 1 :=
  sorry

/- Indeed, the lemmas above uniquely specify `Chain.length`. -/
lemma eq_length_of_spec (f : ∀ {x y : α}, Chain x y → ℕ)
    (singleton : ∀ (x : α), f (Chain.singleton x) = 0)
    (cons : ∀ (x y : α) (c : Chain x y) (z : α) (h : y < z), f (Chain.cons c z h) = f c + 1)
    {x y : α} (c : Chain x y) :
    f c = Chain.length c :=
  sorry

/- Implement this function and write out the relevant API lemmas as we did for `Chain.length`. -/
/-- Append two chains with matching end / starting points. -/
def Chain.append {x y : α} : ∀ {z}, Chain x y → Chain y z → Chain x z :=
  sorry
