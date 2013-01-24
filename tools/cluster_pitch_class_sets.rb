#!/usr/bin/env ruby

require 'k_means'

# read the pitch class sets
vectors = File.read("/tmp/pitch_class_set.csv")
              .split("\n")
              .map{ |line| line.split(",").map{ |s| s.to_f } }
              .select{ |x| x.length==12 } # FIXME: why are so many just [0.0]?

# set up some references. these are what we use to rotate each PCS so that it's tonic is in the left-most slot
references = []
references << [1,0,1,0,1,1,0,1,0,1,0,1] # major scale
references << [1,0,1,1,0,1,0,1,1,0,1,0] # natural minor scale
references << [1,0,1,1,0,1,0,1,1,0,0,1] # harmonic minor scale

# rotate each PCS to normalize them by putting their tonic in position 0
0.upto(vectors.length-1) do |idx|
  best_err = 1e10
  best_vector = vectors[idx].clone

  tmp_vector = vectors[idx].clone
  0.upto(11) do |rot_idx|
    references.each do |ref_vector|
      err = ref_vector.zip(tmp_vector).map{ |x| (x[1]-x[0])**2 }.inject(:+)
      if err < best_err
        best_err = err
        best_vector = tmp_vector
      end
    end
    tmp_vector = tmp_vector[1..-1] + tmp_vector[0..0]
  end
  vectors[idx] = best_vector
end

# do the clustering and print out the centroids
kmeans = KMeans.new(vectors, :centroids => 2)
kmeans.centroids.each_with_index do |centroid,idx|
  puts "centroid ##{idx}: " + centroid.position.map{ |x| sprintf("%8.6f", x) }.join(", ")
end
