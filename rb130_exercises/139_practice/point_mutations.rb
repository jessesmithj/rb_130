class DNA 
  def initialize(seq)
    @seq = seq 
  end 

  def hamming_distance(other_seq)
    shorter, longer = [@seq, other_seq].sort_by(&:size)

    shorter.chars.select.with_index do |nuc, idx| 
      nuc != longer[idx] 
    end.size
  end 
end