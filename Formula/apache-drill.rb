class ApacheDrill < Formula
  desc "Schema-free SQL query engine for Hadoop and NoSQL"
  homepage "https://drill.apache.org/download/"
  url "https://www.apache.org/dyn/closer.cgi?path=drill/drill-1.8.0/apache-drill-1.8.0.tar.gz"
  mirror "https://archive.apache.org/dist/drill/drill-1.8.0/apache-drill-1.8.0.tar.gz"
  sha256 "38e359206b3039dca4711b371230b96daefb03fcfdd2bcf3059251e92b3441f7"

  bottle :unneeded

  def install
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  test do
    ENV.java_cache

    pipe_output("#{bin}/sqlline -u jdbc:drill:zk=local", "!tables", 0)
  end
end
