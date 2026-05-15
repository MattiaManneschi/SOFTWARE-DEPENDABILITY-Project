read_model -i ../interlocking.smv
flatten_hierarchy
encode_variables
build_model
pick_state -r

simulate -k 1 -c "req_AB = TRUE & req_CD = TRUE & req_AD = FALSE & req_CB = FALSE & rel_AB = FALSE & rel_AD = FALSE & rel_CB = FALSE & rel_CD = FALSE"

simulate -k 1 -c "req_AB = FALSE & req_AD = FALSE & req_CB = FALSE & req_CD = FALSE & rel_AB = FALSE & rel_AD = FALSE & rel_CB = FALSE & rel_CD = FALSE"

simulate -k 1 -c "req_AB = FALSE & req_AD = FALSE & req_CB = FALSE & req_CD = FALSE & rel_AB = TRUE & rel_AD = FALSE & rel_CB = FALSE & rel_CD = TRUE"

show_traces -v
quit
