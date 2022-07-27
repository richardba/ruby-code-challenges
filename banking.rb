def solution(balances, requests)
  balances.unshift(0)
  
  requests.each_with_index do |elem, index|
    operation = elem.split(' ')
    operation[1] = operation[1].to_i
    operation[2] = operation[2].to_i
    invalid = [-(index+1)]

    if(operation[0].eql? 'withdraw')
      sum = operation[2]
      if(!balances[operation[1]] || sum > balances[operation[1].to_i])
        return invalid
      end
      balances[operation[1]] = balances[operation[1]] - sum
    elsif(operation[0].eql? 'transfer')
      sum = operation[3].to_i
      if(!balances[operation[1]] || !balances[operation[2]] || sum > balances[operation[1].to_i])
        return invalid
      end
      balances[operation[1]] = balances[operation[1]] - sum
      balances[operation[2]] = balances[operation[2]] + sum
    elsif(operation[0].eql? 'deposit')
      if(!balances[operation[1]])
        return invalid
      end
      balances[operation[1]] = balances[operation[1]] + operation[2]
    end
  end
  
  balances.shift()
  balances
end
