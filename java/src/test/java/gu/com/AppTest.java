package gu.com;

import junit.framework.TestCase;
import junit.framework.TestSuite;
import org.junit.Test;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

/**
 * Unit test for simple App.
 */
public class AppTest
        extends TestCase {
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest(String testName) {
        super(testName);
    }

    @Test
    public void testMatcher() {
        assertThat("string", is("string"));
    }

    @Test
    public void testApp() {
        assertTrue(true);
    }
}
