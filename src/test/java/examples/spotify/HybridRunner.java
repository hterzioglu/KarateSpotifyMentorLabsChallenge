package examples.spotify;

import com.intuit.karate.junit5.Karate;

public class HybridRunner {
    @Karate.Test
    Karate testUsers() {return Karate.run("hybrid").relativeTo(getClass());
    }
}
