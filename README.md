# Making many body column vectors for Magnetic Spin 1/2 Systems

## Sparknotes

We want to be able to write a column vector for many body spin 1/2 chains. We can do this if we know the single particular spinors. 
This code takes in an array of spinors

initial_prod_states = [$\sigma_1,\sigma_2,\sigma_3,...,\sigma_k,...,\sigma_N$]

$|\sigma_k\rangle = \alpha_k |\uparrow\rangle +\beta_k |\downarrow\rangle$
where $\sigma_k$ = [$\alpha_k$,$\beta_k$]

And it produces the many body column vector in the ising basis.

The module is written in the file product_state_generator.jl. You can use state_testing.jl as a template or write the following lines at the top of your julia file

include("product_state_generator.jl")
using .Prod_State_Gen_Mod

Must define the the following variables \bf{sites, spin, initial_prod_states}}

then call the function

Prod_State_Gen_Mod.Prod_State_Gen(sites,spin,initial_prod_states)


Example:

input:

sites = 2 

spin = 0.5

initial_prod_states = [[1,0],[1,0]]


output:

$$| \psi \rangle = \begin{bmatrix}1\\ 0\\ 0\\ 0 \end{bmatrix} ^{\dagger}$$

## The getspin(b,sites-1) function

### This code uses binary for spin 1/2 qubits
We use the intergers as a way to keep track of spin configurations (basis states). We use ising states (eigenstates of $S_z$) as basis states. 

In the convention used 
$1  = |\uparrow \rangle$
$0  = |\downarrow \rangle$


For example for a spin chain of size 4
$$0_40_30_20_1 = |\downarrow_1 \downarrow_2 \downarrow_3 \downarrow_4\rangle$$
$$0_40_30_21_1 = |\uparrow_1 \downarrow_2 \downarrow_3 \downarrow_4\rangle$$
$$0_40_31_20_1 = |\downarrow_1 \uparrow_2 \downarrow_3 \downarrow_4\rangle$$
$$0_41_30_20_1 = |\downarrow_1 \downarrow_2 \uparrow_3 \downarrow_4\rangle$$
$$1_40_30_20_1 = |\downarrow_1 \downarrow_2 \downarrow_3 \uparrow_4\rangle$$

$$\dots$$

$$1_41_31_21_1 = |\uparrow_1 \uparrow_2 \uparrow_3 \uparrow_4\rangle$$

There an important function we use in the code

getspin(b, site-1)

if site = 1
sites -1  = 0
uses bit operations to 
$$0_40_30_2\underbrace{1_1}_{sites -1 = 0} = |\uparrow_1 \downarrow_2 \downarrow_3 \downarrow_4\rangle$$

returns 1 if bit is 1 and 0 if the bit is 0






