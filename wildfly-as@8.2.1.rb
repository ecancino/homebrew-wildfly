
class WildflyAsAT821 < Formula
  desc "Managed application runtime for building applications"
  homepage "http://wildfly.org/"
  url "https://download.jboss.org/wildfly/8.2.1.Final/wildfly-8.2.1.Final.tar.gz"
  sha256 "845bc298ef9d72cf91b8781286a64554dea353df9d555391720635f32b73717c"

  depends_on :java => "1.7+"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    The home of WildFly Application Server 8 is:
      #{opt_libexec}
    You may want to add the following to your .bash_profile:
      export JBOSS_HOME=#{opt_libexec}
      export PATH=${PATH}:${JBOSS_HOME}/bin
    EOS
  end

  test do
    system "#{opt_libexec}/bin/standalone.sh --version | grep #{version}"
  end
end
