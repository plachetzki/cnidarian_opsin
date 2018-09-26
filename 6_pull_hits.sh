
# strip away unwanted space and prefix to file names
rename ' ' '' ./tip_files/*.txt
rename 'RAxML_bestTree.' '' ./tip_files/*.txt


## UNDER WORK, loop for selectSeqs.pl will be up soon. ]
# Retrieves sequence data for all the genes that were included in the trees export from tree_editor.R script
perl ./selectSeqs.pl -f ./tip_files/Abylopsis_tips.txt ./fastas/Abylopsis.fas > Abylopsis_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Acanthoscurria_tips.txt ./fastas/Acanthoscurria.fas > Acanthoscurria_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Acropora_tips.txt ./fastas/Acropora.fas > Acropora_seqs.fas 
perl ./selectSeqs.pl -f ./tip_files/Aegina_tips.txt ./fastas/Aegina.fas > Aegina_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Agalma_tips.txt ./fastas/Agalma.fas > Agalma_seqs.fas 
perl ./selectSeqs.pl -f ./tip_files/Aiptasia_tips.txt ./fastas/Aiptasia.fas > Aiptasia_seqs.fas 
perl ./selectSeqs.pl -f ./tip_files/Alatina_tips.txt  ./fastas/Alatina.fas > Alatina_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Amphimedon_tips.txt ./fastas/Amphimedon.fas > Amphimedon_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Anemonia_tips.txt ./fastas/Anemonia.fas > Anemonia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Anthopleura_tips.txt ./fastas/Anthopleura.fas > Anthopleura_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Atolla_tips.txt ./fastas/Atolla.fas > Atolla_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Aurelia_tips.txt ./fastas/Aurelia.fas > Aurelia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Bolocera_tips.txt ./fastas/Bolocera.fas > Bolocera_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Brachionus_tips.txt ./fastas/Brachionus.fas > Brachionus_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Calvadosia_tips.txt ./fastas/Calvadosia.fas > Calvadosia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Capitella_tips.txt ./fastas/Capitella.fas > Capitella_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Cassiopea_tips.txt ./fastas/Cassiopea.fas > Cassiopea_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Cerianthus_tips.txt ./fastas/Cerianthus.fas > Cerianthus_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Chironex_tips.txt ./fastas/Chironex.fas > Chironex_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Chrysaora_tips.txt ./fastas/Chrysaora.fas > Chrysaora_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Clytia_tips.txt ./fastas/Clytia.fas > Clytia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Coeloplana_tips.txt ./fastas/Coeloplana.fas > Coeloplana_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Convolutriloba_tips.txt ./fastas/Convolutriloba.fas > Convolutriloba_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Corallium_tips.txt ./fastas/Corallium.fas > Corallium_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Corynactis_tips.txt ./fastas/Corynactis.fas > Corynactis_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Craseoa_tips.txt ./fastas/Craseoa.fas > Craseoa_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Craspedacusta_tips.txt ./fastas/Craspedacusta.fas > Craspedacusta_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Crassostrea_tips.txt ./fastas/Crassostrea.fas > Crassostrea_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Craterolophus_tips.txt ./fastas/Craterolophus.fas > Craterolophus_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Ctenactis_tips.txt ./fastas/Ctenactis.fas > Ctenactis_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Cyanea_tips.txt ./fastas/Cyanea.fas > Cyanea_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Daphnia_tips.txt ./fastas/Daphnia.fas > Daphnia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Drosophila_tips.txt ./fastas/Drosophila.fas > Drosophila_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Ectopleura_tips.txt ./fastas/Ectopleura.fas > Ectopleura_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Edwardsiella_tips.txt ./fastas/Edwardsiella.fas > Edwardsiella_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Eunicella_c_tips.txt ./fastas/Eunicella_c.fas > Eunicella_c_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Eunicella_v_tips.txt ./fastas/Eunicella_v.fas > Eunicella_v_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Favia_tips.txt ./fastas/Favia.fas > Favia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Gorgonia_tips.txt ./fastas/Gorgonia.fas > Gorgonia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Grantia_tips.txt ./fastas/Grantia.fas > Grantia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Haliclystus_a_tips.txt ./fastas/Haliclystus_a.fas > Haliclystus_a_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Haliclystus_s_tips.txt ./fastas/Haliclystus_s.fas > Haliclystus_s_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Homo_tips.txt ./fastas/Homo.fas > Homo_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Hormathia_tips.txt ./fastas/Hormathia.fas > Hormathia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Hydractinia_p_tips.txt ./fastas/Hydractinia_p.fas > Hydractinia_p_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Hydractinia_s_tips.txt ./fastas/Hydractinia_s.fas > Hydractinia_s_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Hydra_m_tips.txt ./fastas/Hydra_m.fas > Hydra_m_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Hydra_o_tips.txt ./fastas/Hydra_o.fas > Hydra_o_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Hydra_vi_tips.txt ./fastas/Hydra_vi.fas > Hydra_vi_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Hydra_vu_tips.txt ./fastas/Hydra_vu.fas > Hydra_vu_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Kudoa_tips.txt ./fastas/Kudoa.fas > Kudoa_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Lampea_tips.txt ./fastas/Lampea.fas > Lampea_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Leptogorgia_tips.txt ./fastas/Leptogorgia.fas > Leptogorgia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Leucernaria_tips.txt ./fastas/Leucernaria.fas > Leucernaria_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Lingula_tips.txt ./fastas/Lingula.fas > Lingula_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Lobactis_tips.txt ./fastas/Lobactis.fas > Lobactis_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Lottia_tips.txt ./fastas/Lottia.fas > Lottia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Madracis_tips.txt ./fastas/Madracis.fas > Madracis_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Meara_tips.txt ./fastas/Meara.fas > Meara_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Metridium_tips.txt ./fastas/Metridium.fas > Metridium_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Mnemiopsis_tips.txt ./fastas/Mnemiopsis.fas > Mnemiopsis_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Montastraea_c_tips.txt ./fastas/Montastraea_c.fas > Montastraea_c_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Montastraea_f_tips.txt ./fastas/Montastraea_f.fas > Montastraea_f_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Myxobolus_c_tips.txt ./fastas/Myxobolus_c.fas > Myxobolus_c_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Myxobolus_p_tips.txt ./fastas/Myxobolus_p.fas > Myxobolus_p_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Namomia_tips.txt ./fastas/Namomia.fas > Namomia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Nematostella_tips.txt ./fastas/Nematostella.fas > Nematostella_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Nephthyigorgia_tips.txt ./fastas/Nephthyigorgia.fas > Nephthyigorgia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Notospermus_tips.txt ./fastas/Notospermus.fas > Notospermus_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Periphylla_tips.txt ./fastas/Periphylla.fas > Periphylla_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Phoronis_tips.txt ./fastas/Phoronis.fas > Phoronis_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Physalia_tips.txt ./fastas/Physalia.fas > Physalia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Pinctata_tips.txt ./fastas/Pinctata.fas > Pinctata_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Plakina_tips.txt ./fastas/Plakina.fas > Plakina_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Platygyra_tips.txt ./fastas/Platygyra.fas > Platygyra_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Pleraplysilla_tips.txt ./fastas/Pleraplysilla.fas > Pleraplysilla_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Pocillopora_tips.txt ./fastas/Pocillopora.fas > Pocillopora_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Podocoryna_tips.txt ./fastas/Podocoryna.fas > Podocoryna_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Polypodum_tips.txt ./fastas/Polypodum.fas > Polypodum_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Porites_tips.txt ./fastas/Porites.fas > Porites_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Protopalythoa_tips.txt ./fastas/Protopalythoa.fas > Protopalythoa_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Renilla_tips.txt ./fastas/Renilla.fas > Renilla_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Rhodactis_tips.txt ./fastas/Rhodactis.fas > Rhodactis_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Ricordea_tips.txt ./fastas/Ricordea.fas > Ricordea_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Saccoglossus_tips.txt ./fastas/Saccoglossus.fas > Saccoglossus_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Seriatopora_tips.txt ./fastas/Seriatopora.fas > Seriatopora_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Stomolophus_tips.txt ./fastas/Stomolophus.fas > Stomolophus_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Strongylocentrotus_tips.txt ./fastas/Strongylocentrotus.fas > Strongylocentrotus_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Taeniopygia_tips.txt ./fastas/Taeniopygia.fas > Taeniopygia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Thelohanellus_tips.txt ./fastas/Thelohanellus.fas > Thelohanellus_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Trichoplax_tips.txt ./fastas/Trichoplax.fas > Trichoplax_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Tripedalia_tips.txt ./fastas/Tripedalia.fas > Tripedalia_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Turritopsis_tips.txt ./fastas/Turritopsis.fas > Turritopsis_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Vallicula_tips.txt ./fastas/Vallicula.fas > Vallicula_seqs.fas
perl ./selectSeqs.pl -f ./tip_files/Xenoturbella_tips.txt ./fastas/Xenoturbella.fas > Xenoturbella_seqs.fas

# put all fastas in new dir
mkdir tip_seqs

mv *seqs.fas tip_seqs

