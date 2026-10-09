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
            Assert.That(Code.PairingTest.TestFunction(), Is.True);
        }
    }
}