require 'spec_helper'

describe CaesarCipher do
  subject { described_class }
  context "args: 'Testowy Tekst'" do
    specify { expect(subject.new('Testowy Tekst').perform).to eq "Grfgbjl Grxfg" }
  end

  context "args: 'Ala ma...psa!', 4" do
    specify { expect(subject.new('Ala ma...psa!', 4).perform).to eq "Epe qe...twe!" }
  end

  context "args: 'Ala ma...psa!', -4" do
    specify { expect(subject.new('Ala ma...psa!', -4).perform).to eq "Whw iw...low!" }
  end

  context "args: 'Ala ma...psa!', 26" do
    specify { expect(subject.new('Ala ma...psa!', 26).perform).to eq "Ala ma...psa!" }
  end

  context "args: 'Ala ma...psa!', -26" do
    specify { expect(subject.new('Ala ma...psa!', -26).perform).to eq "Ala ma...psa!" }
  end
end
