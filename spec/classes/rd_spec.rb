require "spec_helper"

describe "mystuff::rd" do
  hiera = Hiera.new( config: 'hiera.yaml' )

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

      # I look at this as setting the "expected" value to ensure my tests pass
      version = hiera.lookup("mystuff::rd::version", nil, facts)

      it { is_expected.to compile.with_all_deps }
      it { should contain_class("java").with_distribution("jre") }

      it { should contain_class("rundeck")
        .with_package_ensure(version)
        .that_requires("Class[java]")
      }
    end
  end
end
