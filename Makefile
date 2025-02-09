release-all: package-all init
	cr upload --skip-existing
	cr index --push

package-all:
	cr package charts/postgres-pgdump-backup
	cr package charts/iperf3
	cr package charts/rundeck
	cr package charts/openldap-test
	cr package charts/nist-data-mirror

init:
	# cr remote needs to be https due to https://github.com/helm/chart-releaser/issues/124
	git remote -v | grep cr-remote > /dev/null || git remote add cr-remote https://github.com/EugenMayer/helm-charts.git -f
	git fetch -a cr-remote
