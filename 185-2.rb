require 'rubygems'
require 'charlie' # meow

Possibilia = "0123456789"

class Solution < StringGenotype(16, Possibilia)
  
  Sequences = [
    ["5616185650518293", 2],
    ["3847439647293047", 1],
    ["5855462940810587", 3],
    ["9742855507068353", 3],
    ["4296849643607543", 3],
    ["3174248439465858", 1],
    ["4513559094146117", 2],
    ["7890971548908067", 3],
    ["8157356344118483", 1],
    ["2615250744386899", 2],
    ["8690095851526254", 3],
    ["6375711915077050", 1],
    ["6913859173121360", 1],
    ["6442889055042768", 2],
    ["2321386104303845", 0],
    ["2326509471271448", 2],
    ["5251583379644322", 2],
    ["1748270476758276", 3],
    ["4895722652190306", 1],
    ["3041631117224635", 3],
    ["1841236454324589", 3],
    ["2659862637316867", 2]
  ]
  
  # TODO: figure out wtf
  #use BestOnlySelection, SinglePointCrossover
  use TournamentSelection(3), SinglePointCrossover, ListMutator(:n_point[3], :replace[*'0'..'9'])
  
  def fitness
    Sequences.inject(0.0) do |fitness, sequence|
      diff = sequence[1] - genes.zip(sequence[0].chars).find_all { |a,b| a==b }.size
      #fitness + (diff == 0 ? 1.5 : -diff.abs)
      #fitness - (diff == 0 ? -10 : diff.abs ** 1.5)
      #fitness - diff == 0 ? 1 : 0
      #fitness - diff == 0 ? -1 : (diff.abs ** 0.25)
      fitness - diff.abs
    end
  end
end

Population.new(Solution, 25).evolve_on_console(10000)

# GABenchmark.benchmark(Solution,'185-report.html') {
#    selection BestOnlySelection, TournamentSelection(5), TournamentSelection(15)
#    crossover SinglePointCrossover, UniformCrossover
#    population_size 50
#    generations 2500
#    mutator *[1,3,5].map{ |n| ListMutator(:n_point[n], :replace[*'0'..'9']) }
#  }