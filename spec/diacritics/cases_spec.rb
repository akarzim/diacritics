require 'spec_helper'

describe Diacritics::Cases do
  context 'French only' do
    subject { Diacritics::Cases.new :fr }
    let(:string) { 'je dîne d’exquis rôtis de bœuf au kir à l’aÿ d’âge mûr & cætera !' }
    let(:result) { 'je dine d’exquis rotis de boeuf au kir a l’ay d’age mur & caetera !' }

    it { expect(subject.permanent string).to eq result }
  end

  context 'English and French only' do
    subject { Diacritics::Cases.new %i[en fr] }
    let(:string) { 'je dîne d’exquis rôtis de bœuf au kir à l’aÿ d’âge mûr & cætera !' }
    let(:result) { 'je-dine-d’exquis-rotis-de-boeuf-au-kir-a-l’ay-d’age-mur-&-caetera-' }

    it { expect(subject.permanent string).to eq result }
  end
end
