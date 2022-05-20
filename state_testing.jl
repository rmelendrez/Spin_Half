include("product_state_generator.jl")

using .Prod_State_Gen_Mod



xket = [1/sqrt(2),1/sqrt(2)]

sites = 2
spin = 1/2

xkets = []
for i in 1:sites
	push!(xkets,xket)
end



println("(|↑>+|↓>)/sqrt(2) ⊗ (|↑>+|↓>)/sqrt(2) = (|↑>|↑>+|↑>|↓>+|↓>|↑>+|↓>|↓>)/2")

print(Prod_State_Gen_Mod.Prod_State_Gen(sites,spin,xkets))


