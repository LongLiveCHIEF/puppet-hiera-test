require "spec_helper"

describe "puppet_hiera_test::rundeck" do
  hiera = Hiera.new( config: 'spec/fixtures/hiera/hiera.yaml' )

  test_on = {
    :supported_os => [
      {
        "operatingsystem"        => "Ubuntu",
        "operatingsystemrelease" => ['16.04'],
      }
    ]
  }

  on_supported_os(test_on).each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      version = hiera.lookup("puppet_hiera_test::rundeck::version", nil, facts)

      it { is_expected.to compile.with_all_deps }
      it { should contain_class("java").with_distribution("jre") }

      it { should contain_class("rundeck")
        .with_package_ensure(version)
        .that_requires("Class[java]")
      }
    end
  end
end
