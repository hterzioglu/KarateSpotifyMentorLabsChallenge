package examples.spotify;

import com.intuit.karate.junit5.Karate;

public class apiRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("api").relativeTo(getClass());
    }
}
