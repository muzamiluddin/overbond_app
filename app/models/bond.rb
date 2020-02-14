class Bond < ApplicationRecord
    attr_accessor :benchmark_term_diff, :benchmark_bond


    # Calculates the benchmark bond diff by looping over all the other bonds and finding the closest bond
    def benchmark_bond
        benchmark_term_diff = nil
        closest_bond = nil
        
        Bond.all.each do |bond|
            next if bond.id == self.id
            term_diff = (bond.term - self.term).abs   
        
            # Set the first bond as benchmark bond to start with
            if !benchmark_term_diff || term_diff < benchmark_term_diff
                benchmark_term_diff = term_diff 
                closest_bond = bond
            end
        end
        closest_bond
    end

    
    def spread_to_benchmark
        self.yield - benchmark_bond.yield  # benchmark_bond value can be cached to avoid recalculating to improve performance
    end

    def is_corporate?
        self.bond_type == 'corporate'
    end

    def interpolated_value
        bond_list = Bond.where(bond_type: 'government').order(:term)
        lower_bond = get_closest_bond(bond_list, true)
        upper_bond = get_closest_bond(bond_list, false)
       # Calculate interpolation value using the formula: (x2-x1)(y3-y1)/(x3-x1) + y1
        slope = (upper_bond.yield - lower_bond.yield)/(upper_bond.term - lower_bond.term)
        val = slope * (self.term - lower_bond.term)  + lower_bond.yield
        val
    end

    def get_closest_bond(bond_list, position_lower = true)
        closest_bond = closest_bond_term_diff = nil
        
        bond_list.each do |bond|
            next if bond.id == self.id

            if position_lower
                term_diff = self.term - bond.term
            else
                term_diff= bond.term - self.term
            end
           
            if term_diff >= 0 && (!closest_bond  || term_diff < closest_bond_term_diff) 
                closest_bond = bond
                closest_bond_term_diff = term_diff
            end
        end
        closest_bond
    end

    def gov_bond_curve
        (self.yield - interpolated_value).round(2)
    end

    





end
