require 'spec_helper'

describe Diacritics::Cases do
  context 'French only' do
    subject { Diacritics::Cases.new(lang: :fr) }
    let(:string) { 'je dîne d’exquis rôtis de bœuf au kir à l’aÿ d’âge mûr & cætera !' }
    let(:result) { 'je dine d’exquis rotis de boeuf au kir a l’ay d’age mur & caetera !' }

    it { expect(subject.permanent string).to eq result }
  end

  context 'English and French only' do
    subject { Diacritics::Cases.new(lang: %i[en fr]) }
    let(:string) { 'je dîne d’exquis rôtis de bœuf au kir à l’aÿ d’âge mûr & cætera !' }
    let(:result) { 'je-dine-d’exquis-rotis-de-boeuf-au-kir-a-l’ay-d’age-mur-&-caetera-' }

    it { expect(subject.permanent string).to eq result }
  end

  context 'replace space with underscore' do
    subject { Diacritics::Cases.new(space_replace_char: '_') }
    let(:string) { 'je dîne d’exquis rôtis de bœuf au kir à l’aÿ d’âge mûr & cætera !' }
    let(:result) { 'je_dine_d’exquis_rotis_de_boeuf_au_kir_a_l’ay_d’age_mur_&_caetera_' }

    it { expect(subject.permanent string).to eq result }
  end

end
