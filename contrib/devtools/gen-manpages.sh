#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

CARROTD=${CARROTD:-$SRCDIR/carrotd}
CARROTCLI=${CARROTCLI:-$SRCDIR/carrot-cli}
CARROTTX=${CARROTTX:-$SRCDIR/carrot-tx}
CARROTQT=${CARROTQT:-$SRCDIR/qt/carrot-qt}

[ ! -x $CARROTD ] && echo "$CARROTD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
RVNVER=($($CARROTCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for carrotd if --version-string is not set,
# but has different outcomes for carrot-qt and carrot-cli.
echo "[COPYRIGHT]" > footer.h2m
$CARROTD --version | sed -n '1!p' >> footer.h2m

for cmd in $CARROTD $CARROTCLI $CARROTTX $CARROTQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${RVNVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${RVNVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
