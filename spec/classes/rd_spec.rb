require "spec_helper"

describe "mystuff::rd", type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      it { is_expected.to compile.with_all_deps }
      it { should contain_package("somepackage").with_ensure("4.1.2-29") }
    end
  end
end
