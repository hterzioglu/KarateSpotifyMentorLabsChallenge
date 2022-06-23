package examples.spotify;

import com.intuit.karate.junit5.Karate;

public class e2eRunner {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("e2e").relativeTo(getClass());
    }
}
