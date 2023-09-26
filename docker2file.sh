#!/bin/bash
#########################################################################
#########################################################################
case "$OSTYPE" in
    linux*)
        docker history --no-trunc --format "{{.CreatedBy}}" $1 | # extract information from layers
        tac                                                    | # reverse the file
        sed 's,^\(|3.*\)\?/bin/\(ba\)\?sh -c,RUN,'             | # change /bin/(ba)?sh calls to RUN
        sed 's,^RUN #(nop) *,,'                                | # remove RUN #(nop) calls for ENV,LABEL...
        sed 's,  *&&  *, \\\n \&\& ,g'                           # pretty print multi command lines following Docker best practices
    ;;
    darwin*)
        docker history --no-trunc --format "{{.CreatedBy}}" $1 | # extract information from layers
        tail -r                                                | # reverse the file
        sed -E 's,^(\|3.*)?/bin/(ba)?sh -c,RUN,'               | # change /bin/(ba)?sh calls to RUN
        sed 's,^RUN #(nop) *,,'                                | # remove RUN #(nop) calls for ENV,LABEL...
        sed $'s,  *&&  *, \\\ \\\n \&\& ,g'                      # pretty print multi command lines following Docker best practices
    ;;
    *)
        echo "unknown OSTYPE: $OSTYPE"
    ;;
esac

