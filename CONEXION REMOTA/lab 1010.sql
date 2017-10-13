create rol nom1 identified root;

grant select on xe to nom1;

create user bd1 identified by pass;

grant nom1 to bd1;