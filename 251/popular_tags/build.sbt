lazy val common = Seq(
  organization := "week9.mids",
  version := "0.1.0",
  scalaVersion := "2.10.6",
  libraryDependencies ++= Seq(
    "org.apache.spark" %% "spark-streaming" % "1.6.1" % "provided",
    "org.apache.spark" %% "spark-streaming-twitter" % "1.6.1",
    "com.datastax.spark" %% "spark-cassandra-connector" % "1.3.0-M2",
    "com.typesafe" % "config" % "1.3.0"
  ),
  mergeStrategy in assembly <<= (mergeStrategy in assembly) { (old) =>
     {
      case PathList("META-INF", xs @ _*) => MergeStrategy.discard
      case x => MergeStrategy.first
     }
  }
)

lazy val TwitterPopularTags = (project in file(".")).
  settings(common: _*).
  settings(
    name := "TwitterPopularTags",
    mainClass in (Compile, run) := Some("TwitterPopularTags"))
