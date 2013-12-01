<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="category-list">
        <ul>
            <?php foreach ($categories as $category) { ?>
                <li>
                    <?php
                        $text_category = $category['name'];
                        $text_category = str_replace(array('(',')'),array('<span>(',')</span>'),$text_category);
                    ?>
                    <?php if ($category['category_id'] == $category_id) { ?>
                        <a href="<?php echo $category['href']; ?>" class="current"><?php echo $text_category; ?></a>
                    <?php } else { ?>
                        <a href="<?php echo $category['href']; ?>"><?php echo $text_category; ?></a>
                    <?php } ?>
                </li>
            <?php } ?>
        </ul>
    </div>
</div>