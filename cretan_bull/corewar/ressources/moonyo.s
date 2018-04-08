.name "moonyo"
.comment "moooooooooo"

main:		sti r1, %:live, %1
			and r1, %0, r1
			fork %:moon

live:		live %1
			zjmp %:live

moon:		st r1, 42
			live %1
