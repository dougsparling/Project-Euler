require "rubygems"
require "gga4r"
	
class Solution < String
  
  Sequences = [
    ["5616185650518293",2],
    ["3847439647293047",1],
    ["5855462940810587",3],
    ["9742855507068353",3],
    ["4296849643607543",3],
    ["3174248439465858",1],
    ["4513559094146117",2],
    ["7890971548908067",3],
    ["8157356344118483",1],
    ["2615250744386899",2],
    ["8690095851526254",3],
    ["6375711915077050",1],
    ["6913859173121360",1],
    ["6442889055042768",2],
    ["2321386104303845",0],
    ["2326509471271448",2],
    ["5251583379644322",2],
    ["1748270476758276",3],
    ["4895722652190306",1],
    ["3041631117224635",3],
    ["1841236454324589",3],
    ["2659862637316867",2]
  ]
  
  # new random solution
  def self.random
    sol = new(Sequences[0][0])
    0.upto(sol.size - 1) do |index|
      sol[index] = (rand * 10).to_i.to_s
    end
    sol
  end
  
  PossibleMatches = Sequences.inject(0) { |sum, seq| sum + seq[1] }

  # the difference between the expected and actual number of matches against all sequences
  def fitness
    Sequences.inject(0.0) do |fitness, sequence|
      # count matches
      matches = 0
      0.upto(size - 1) do |index|
        if(self[index] == sequence[0][index])
          matches += 1
        end
      end
      # more is worse
      fitness - (sequence[1] - matches).abs
    end
  end

  def recombine(other)
    # copy other and replace roughly half with self
    solution = other.dup
    0.upto(size-1) do |index|
      solution[index] = self[index] if rand > 0.5
    end
    solution
  end

  def mutate
    mutate_point = (rand * self.size).to_i
    self[mutate_point] = (rand * 10).to_i.to_s
  end
end

def create_population(size = 100)
  Array.new(size).collect! { |x| Solution.random }
end	
	