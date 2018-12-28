require 'pry'
=begin
Translating codons (three character string sequences) into amino acids
Note: Some amino acids have more than one related codon
Must have two class methods:
- Translation#of_codon
  - Takes one codon (AUG) and returns the matching amino acid.
- Transation#of_rna
  - Takes a string of codons and returns a string of matching amino acids
  
Data Structure
  - Hash. Codons as keys. Aminos as values.
  
Algorithms
  - #of_codon
    - return the matching value for a passed codon key
  - #of_rna
    - split string into an array of codons
      Options:
      1. 
    - iterate over the array using the #map and #of_codon on each element
    - return when #of_codon returns STOP
    - #pop and #join(' ') when done
=end
class InvalidCodonError < StandardError; end

class Translation
  CODONS = {AUG: "Methionine",
            UUU: "Phenylalanine",
            UUC: "Phenylalanine",
            UUA: "Leucine",
            UUG: "Leucine",
            UCU: "Serine",
            UCC: "Serine",
            UCA: "Serine",
            UCG: "Serine",
            UAU: "Tyrosine",
            UAC: "Tyrosine",
            UGU: "Cysteine",
            UGC: "Cysteine",
            UGG: "Tryptophan",
            UAA: "STOP",
            UAG: "STOP",
            UGA: "STOP"
  }
  
  def self.of_codon(codon)
    CODONS.fetch(codon.to_sym) { raise InvalidCodonError }
  end
  
  def self.of_rna(strand)
    rna = []
    strand.scan(/[ACGU]{3}/).each do |codon|
      break if of_codon(codon) == "STOP"
      rna << of_codon(codon)
    end
    raise InvalidCodonError if rna.empty?
    rna
  end
  
end

binding.pry

puts "hi"
