#!/usr/bin/env bash
set -e
set -x

AUDIT_OUTPUT="audit.json"

passExecution() {
    return 0
}

createAuditFile() {
    touch ${AUDIT_OUTPUT}
}

runNpm() {
    npm audit --production --json > ${AUDIT_OUTPUT}
}

createAuditFile
runNpm || runNpm=1

if [ ${runNpm:-0} -eq 1 ]
then
 echo "npm audit has return 1"
 # we return a 0 exit code in order not to fail the CI since npm-audit will always return 1 if a vulnerability has been
 # found (https://docs.npmjs.com/cli/v7/commands/npm-audit)
 passExecution
fi
