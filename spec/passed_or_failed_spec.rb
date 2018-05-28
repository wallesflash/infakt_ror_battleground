require 'spec_helper'

describe PassedOrFailed do
  subject { described_class.new(results, threshold).result }

  context 'first dataset' do
    let(:results) { { "Mark" => 10, "Ellen" => "65", "Roger" => 20, "Mike" => "70" } }
    let(:threshold) { "65" }
    let(:expected_hash) { { passed: { "Ellen" => 65, "Mike" => 70 }, failed: { "Mark" => 10, "Roger" => 20 } }}

    specify{ expect(subject).to eq(expected_hash) }
  end

  context 'second dataset' do
    let(:results) { { "Mark" => "10", "Ellen" => "65", "Roger" => "20", "Mike" => "70" } }
    let(:threshold) { 20 }
    let(:expected_hash) { { passed: { "Ellen" => 65, "Roger" => 20, "Mike" => 70 }, failed: { "Mark" => 10 } }}

    specify{ expect(subject).to eq(expected_hash) }
  end

  context 'third dataset' do
    let(:results) { { "Mark" => "10", "Ellen" => "65", "Roger" => "20", "Mike" => "70" } }
    let(:threshold) { 100 }
    let(:expected_hash) { { passed: {}, failed: { "Mark" => 10, "Ellen" => 65, "Roger" => 20, "Mike" => 70 } }}

    specify{ expect(subject).to eq(expected_hash) }
  end

  context 'fourth dataset' do
    let(:results) { { "Mark" => "10", "Ellen" => "65", "Roger" => "20", "Mike" => "70" } }
    let(:threshold) { 5 }
    let(:expected_hash) { { passed: { "Mark" => 10, "Ellen" => 65, "Roger" => 20, "Mike" => 70 }, failed: {} }}

    specify{ expect(subject).to eq(expected_hash) }
  end
end
