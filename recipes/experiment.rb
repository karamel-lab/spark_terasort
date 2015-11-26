
script 'run_experiment' do
  cwd "/tmp"
  user node['spark_terasort']['user']
  group node['spark_terasort']['group']
  interpreter "bash"
  code <<-EOM
wget https://s3-eu-west-1.amazonaws.com/karamel/terasort_2.10-0.0.1.jar

/srv/spark-1.3.1-bin-hadoop2.4/bin/spark-submit --master spark://#{node.spark_terasort.experiment.public_ips[0]}:7077 --class eastcircle.terasort.SparkTeraSort /tmp/terasort_2.10-0.0.1.jar hdfs://#{node.spark_terasort.experiment.public_ips[0]}:8020 /srv/teragen/ /terasortOut 1
  EOM
end

