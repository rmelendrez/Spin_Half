# Ronald Melendrez
# Product State Generator for s = ½
# 5/20/2022

# to construct module in julia

module Prod_State_Gen_Mod
	
	struct Prod_State_Gen

		# struct parameters
		sites :: Int64	
		spin :: Float64
		initial_prod_states :: Array{ComplexF64}
		
		function Prod_State_Gen()
			new(1,1,1)
		end

		

		function Prod_State_Gen(sites,spin,initial_prod_states)

			# Sᵢᶻ get spin projection along z in binary notation
			function getspin(b,i)
				b >> i & 1
			end

			# Generates dimension of hilbert space
			dim = Int64(2*spin+1)^sites
			# Initializes Many Body column vector
			manybodystate= zeros(ComplexF64,dim)

			for (i,elem) in enumerate(manybodystate)
				manybodystate[i] = 1.0+ 0.0*im
			end			



			# Generates full basislist for spin ½ with the integers
			# Binary book keeping for spin ½
			fullbasislist = UnitRange(0,dim-1)
			
			# Initializes dictionary for spin ½
			fullbasislookup = Dict()
			
			# Populates dictionary for spin ½
			for (i,element) in enumerate(fullbasislist)
				fullbasislookup[element] = i
			end
			
			# spin up down to look in |ψ> = [a,b] 
			# a corresponds to single particle |↓> and b corresponds to |↑> 
			updownlookup = Dict()
			updownlookup[0] = 1
			updownlookup[1] = 2
			

			# populates many body state in full basis
			for (i,state) in enumerate(fullbasislist)
				for j in 1:sites
					manybodystate[i] *= initial_prod_states[j][updownlookup[getspin(state,j-1)]]
				end
			end
			return manybodystate
		end
	end
end

							
