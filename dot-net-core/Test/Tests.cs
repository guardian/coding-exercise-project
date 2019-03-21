using NUnit.Framework;
using Code;

namespace Tests
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void ExampleTest()
        {
            Assert.IsTrue(Code.PairingTest.TestFunction());
        }
    }
}