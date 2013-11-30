require 'rubygems'
require 'charlie' # meow

Possibilia = ('0'..'9').to_a.join

class Solution < StringGenotype(5, Possibilia)
  
  Sequences = [
    ["90342", 2],
    ["70794", 0],
    ["39458", 2],
    ["34109", 1],
    ["51545", 2],
    ["12531", 1]
  ]
  
  # TODO: figure out wtf
  #use BestOnlySelection, SinglePointCrossover
  use TournamentSelection(15), UniformCrossover
  
  def fitness
    Sequences.inject(0) do |fitness, sequence|
      diff = sequence[1] - genes.zip(sequence[0].chars).find_all { |a,b| a==b }.size
      #fitness + (diff == 0 ? 1.5 : -diff.abs)
      #fitness - (diff == 0 ? -10 : diff.abs ** 1.5)
      #fitness - diff == 0 ? 1 : 0
      #fitness - diff == 0 ? -1 : (diff.abs ** 0.25)
      fitness - diff.abs
    end
  end
end

Population.new(Solution, 750).evolve_on_console(10000)

# GABenchmark.benchmark(Solution,'185-report.html') {
#    selection BestOnlySelection, TournamentSelection(5), TournamentSelection(15)
#    crossover SinglePointCrossover, UniformCrossover
#    population_size 50
#    generations 2500
#    mutator *[1,3,5].map{ |n| ListMutator(:n_point[n], :replace[*'0'..'9']) }
#  }