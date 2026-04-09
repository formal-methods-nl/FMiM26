/-
Homework 5
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

/-!
# Exercise 1
-/

namespace MyInductiveOdd

-- We defne a "Prop valued" function for expressing oddness of a natural number
inductive OddP : Nat → Prop
| one : OddP 1
| step : ∀ {n}, OddP n → OddP (n + 2)

-- (a)
-- Defne a "Bool valued" function for expressing oddness of a natural number in a similar recursive manner,
-- i.e, uncomment and finish the definition:

/-
def OddB : Nat → Bool
| 0  => sorry -- replace the sorry with the relevant value and add more lines/cases
-/

-- (b)
-- Reflect between OddB and OddP,
-- i.e. uncomment and complete the proof:

/-
theorem Odd_reflect : ∀ n, OddB n = true ↔ OddP n
| 0 => by
    sorry -- replace the sorry with a proof and add more lines/cases
-/

-- (c)
-- Now put a decidable instance on OddP and show that the following "calculation" (after uncommenting) works:

/-
example : OddP 101 := by decide
-/
end MyInductiveOdd


/-!
# Exercise 2

On computable polynomials
-/

section

open Polynomial

/- Recall the following definitions and useful lemma. -/

variable {R : Type*} [DecidableEq R]

def Finsupp.ofList [Zero R] (xs : List R) : ℕ →₀ R where
  toFun := fun n => xs.getD n 0
  support := {i ∈ Finset.range xs.length | xs.getD i 0 ≠ 0}
  mem_support_toFun := by
    simp only [ne_eq, Finset.mem_filter, Finset.mem_range, and_iff_right_iff_imp]
    intro a
    contrapose!
    exact fun a_1 ↦ List.getD_eq_default xs 0 a_1

/-- Sends a list `[a₀, …, aᵣ]` to the polynomial `a₀ + ... + aᵣ * X ^ r`. -/
def Polynomial.ofList [DecidableEq R] [Semiring R] (xs : List R) : R[X] :=
  ⟨Finsupp.ofList xs⟩

/-- Pointwise addition on lists -/
def List.addPointwise [Add R]: List R → List R → List R
  | as, [] => as
  | [], bs => bs
  | (a :: as), (b :: bs) => (a + b) :: as.addPointwise bs

@[simp]
lemma Polynomial.ofList_cons [Semiring R] (x : R) (xs : List R) :
    ofList (x :: xs) = C x + X * ofList xs := by
  ext i
  cases i
  · simp [ofList] ;  rfl
  · simp [ofList] ; rfl

/- The map that sends a polynomial `p` to its formal derivative is defined in Mathlib as
`Polynomial.derivative`.

(a)
Define a *computable* function `List.derivative : List R → List R ` that, given a list `l`,
computes the list corresponding to the derivative of the polynomial defined by `l`.
That is, `ofList (List.derivative l) = Polynomial.derivative (ofList l)` should hold.
(Don't worry about trailing zeros.) -/

def List.derivative [Semiring R] : List R → List R := sorry

-- Prove the following lemma.
lemma ofList_derivative_eq_derivative [Semiring R] (l : List R) :
    ofList (List.derivative l) = derivative (ofList l) := by
  sorry

/- (b)
The function that evaluates a Mathlib polynomial `p : R[X]` at `a : R` is called `Polynomial.eval`.
Define a *computable* function `List.X_mul_eval` that, given an element `a : R` and a list `l`,
computes the value of the polynomial `X * ofList l` at `a`. That is,
`List.X_mul_eval a l = Polynomial.eval a (X * ofList l)` should hold.  -/

def List.X_mul_eval [CommRing R] : R → List R → R := sorry

-- Prove the following lemma
lemma List.mul_X_eval_eq [CommRing R] (l : List R) (a : R):
  List.X_mul_eval a l = Polynomial.eval a (X * ofList l) := by
  sorry

end
