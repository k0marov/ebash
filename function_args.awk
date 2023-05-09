/\ *function.*\(.*\)/ {
	match($0, /\(.*\)/);
	print substr($0, 0, RSTART-1) " {";
	n = split(substr($0, RSTART+1, RLENGTH-2), args, ",");
	printf "\t"
	for (i=1; i<=n; i++) {
		gsub(/^\ */, "", args[i]);
		gsub(/\ *$/, "", args[i]);
		printf args[i] "=$" i ";"; 
	}
	printf "\n";
	next;
} 1
