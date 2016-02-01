#!/usr/bin/env ruby
# Lab 9: Meta-programming Pattern
# Date: 28-Mar-2012
# Author:
# Marco Chávez
require 'test/unit'
require 'attr_init'

class AttrInitTest < Test::Unit::TestCase
  
  class Alpha
    attr_init :beta, :gamma, :delta
  end
  
  class BiologicalClassification
    attr_init :kingdom, :phylum, :klass, :order, :family, :genus, :species
  end    

  def test_alpha    
    alpha = Alpha.new('one', 'two', 'three')
    assert_equal 3, alpha.method(:initialize).arity
    assert_respond_to alpha, :beta
    assert_respond_to alpha, :beta=
    assert_respond_to alpha, :gamma
    assert_respond_to alpha, :gamma=
    assert_respond_to alpha, :delta
    assert_respond_to alpha, :delta=
    assert_equal 'one', alpha.beta
    assert_equal 'two', alpha.gamma
    assert_equal 'three', alpha.delta
    assert_equal 1, (alpha.beta = 1)
    assert_equal 2, (alpha.gamma = 2)
    assert_equal 3, (alpha.delta = 3)
    assert_equal 1, alpha.beta
    assert_equal 2, alpha.gamma
    assert_equal 3, alpha.delta
  end
  
  def test_biological_classification
    platapus = BiologicalClassification.new(
      'Animalia',
      'Chordata',
      'Mammalia',
      'Monotremata',
      'Ornithorhynchidae',
      'Ornithorhynchus',
      'Ornithorhynchus Anatinus')
    assert_equal 7, platapus.method(:initialize).arity
    assert_respond_to platapus, :kingdom
    assert_respond_to platapus, :phylum
    assert_respond_to platapus, :klass
    assert_respond_to platapus, :order
    assert_respond_to platapus, :family
    assert_respond_to platapus, :genus
    assert_respond_to platapus, :species
    assert_respond_to platapus, :kingdom=
    assert_respond_to platapus, :phylum=
    assert_respond_to platapus, :klass=
    assert_respond_to platapus, :order=
    assert_respond_to platapus, :family=
    assert_respond_to platapus, :genus=
    assert_respond_to platapus, :species=
    assert_equal 'Animalia', platapus.kingdom
    assert_equal 'Chordata', platapus.phylum
    assert_equal 'Mammalia', platapus.klass
    assert_equal 'Monotremata', platapus.order
    assert_equal 'Ornithorhynchidae', platapus.family
    assert_equal 'Ornithorhynchus', platapus.genus
    assert_equal 'Ornithorhynchus Anatinus', platapus.species
    assert_equal 'Amoebozoa', (platapus.kingdom = 'Amoebozoa')
    assert_equal 'Tubulinea', (platapus.phylum = 'Tubulinea')
    assert_equal 'Tubulinida', (platapus.order = 'Tubulinida')
    assert_equal 'Amoebidae', (platapus.family = 'Amoebidae')
    assert_equal 'Amoeba', (platapus.genus = 'Amoeba')
    assert_equal 'Amoeba Proteus', (platapus.species = 'Amoeba Proteus')
  end
  
  def test_errors
    assert_raise(ArgumentError) do
      alpha = Alpha.new()
    end    
    assert_raise(ArgumentError) do
      alpha = Alpha.new(1, 2, 3, 4)
    end    
    assert_raise(ArgumentError) do
      alpha = BiologicalClassification.new()
    end
    assert_raise(ArgumentError) do
      alpha = BiologicalClassification.new(
        'Plantae',
        'Magnoliophyta',
        'Magnoliopsida',
        'Rosales',
        'Rosaceae')
    end
  end
  
end